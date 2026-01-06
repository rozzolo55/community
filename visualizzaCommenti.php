<?php
include 'db.php';

// Recupero tutti gli eventi per il menu a tendina

$sql_passati = "SELECT id_evento, titolo, data FROM evento WHERE data < CURDATE()";
$eventi_passati = $pdo->query($sql_passati)->fetchAll();

$commenti = [];

// Se è stato selezionato un evento
if (!empty($_POST['id_evento'])) {

    $id_evento = $_POST['id_evento'];

    $sql = "
        SELECT commento, voto
        FROM post
        WHERE id_evento = :id_evento
        ORDER BY id_post DESC
    ";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':id_evento' => $id_evento
    ]);

    $commenti = $stmt->fetchAll();
}
?>

<p><a href="progettoCommunity.php"><- Torna alla Home</a></p>

<h2>Visualizza commenti e voti di un evento</h2>

<form method="POST">
    <label>Scegli l'evento:</label><br>
    <select name="id_evento" required>
        <option value="">-- Seleziona --</option>
        <?php foreach($eventi_passati as $ev): ?>
            <option value="<?= $ev['id_evento'] ?>"><?= $ev['titolo'] ?> (<?= $ev['data'] ?>)</option>
        <?php endforeach; ?>
    </select>
    <br><br>

    <button type="submit">Mostra</button>
</form>

<?php if (!empty($commenti)): ?>
    <h3>Commenti e voti</h3>

    <?php foreach ($commenti as $post): ?>
        <div style="margin-bottom: 15px;">
            <strong>Voto:</strong> ⭐ <?= htmlspecialchars($post['voto']) ?>/5<br>
            <strong>Commento:</strong><br>
            <?= nl2br(htmlspecialchars($post['commento'])) ?>
            <hr>
        </div>
    <?php endforeach; ?>

<?php elseif ($_SERVER['REQUEST_METHOD'] === 'POST'): ?>
    <p>Nessun commento presente per questo evento.</p>
<?php endif; ?>

