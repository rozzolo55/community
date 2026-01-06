<?php
include 'db.php';

// Recupero le categorie
$categorie = $pdo->query("SELECT * FROM categoria")->fetchAll();

$eventi = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $id_categoria = $_POST['filtro'] ?? null;
    $luogo = trim($_POST['paese'] ?? '');

    if ($id_categoria) {

        $sql = "
            SELECT *
            FROM evento
            WHERE id_categoria = :id_categoria
        ";

        $params = [
            ':id_categoria' => $id_categoria
        ];

        // Se il luogo è stato inserito, aggiungo il filtro
        if (!empty($luogo)) {
            $sql .= " AND luogo LIKE :luogo ";
            $params[':luogo'] = "%$luogo%";
        }

        // Ordinamento cronologico
        $sql .= " ORDER BY data ASC";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $eventi = $stmt->fetchAll();
    }
}
?>


<p><a href="progettoCommunity.php"><- Torna alla Home</a></p>

<h2>Visualizzazione eventi</h2>
<form method="POST">
    <h4>Filtri per la ricerca:</h4>

    <?php foreach ($categorie as $cat): ?>
        <input type="radio" name="filtro" value="<?= $cat['id_categoria'] ?>" required>
        <?= htmlspecialchars($cat['nome']) ?><br>
    <?php endforeach; ?>

    <br>

    <input type="text" name="paese" placeholder="Luogo (facoltativo)"><br><br>

    <button type="submit">Cerca</button>
</form>

<?php if (!empty($eventi)): ?>
    <h3>Eventi trovati:</h3>

    <?php foreach ($eventi as $evento): ?>
        <div style="margin-bottom:15px;">
            <strong><?= htmlspecialchars($evento['titolo']) ?></strong><br>
            <?= htmlspecialchars($evento['luogo']) ?><br>
            <?= date('d/m/Y', strtotime($evento['data'])) ?><br>
            <hr>
        </div>
    <?php endforeach; ?>

<?php elseif ($_SERVER['REQUEST_METHOD'] === 'POST'): ?>
    <p>Nessun evento trovato.</p>
<?php endif; ?>

