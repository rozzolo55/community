<?php
include 'db.php';

// Recupero le categorie per i checkbox
$categorie = $pdo->query("SELECT * FROM categoria")->fetchAll();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nick = $_POST['nickname'];
    $password = md5($nick); // Password = MD5 del nickname

    // Inserimento Utente
    $sql = "INSERT INTO utente (nickname, nome, cognome, email, paese, password) VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$nick, $_POST['nome'], $_POST['cognome'], $_POST['email'], $_POST['paese'], $password]);

    $id_utente = $pdo->lastInsertId();

    // Inserimento Interessi selezionati
    if (!empty($_POST['interessi'])) {
        foreach ($_POST['interessi'] as $id_cat) {
            $sql_int = "INSERT INTO interessi (id_categoria, id_utente) VALUES (?, ?)";
            $pdo->prepare($sql_int)->execute([$id_cat, $id_utente]);
        }
    }
    echo "<p style='color:green'>Registrazione riuscita! La tua password è il tuo nickname.</p>";
}
?>

<h2>Registrazione Community</h2>
<form method="POST">
    <input type="text" name="nickname" placeholder="Nickname" required><br>
    <input type="text" name="nome" placeholder="Nome" required><br>
    <input type="text" name="cognome" placeholder="Cognome" required><br>
    <input type="email" name="email" placeholder="Email" required><br>
    <input type="text" name="paese" placeholder="Paese" required><br>

    <h4>Seleziona i tuoi interessi:</h4>
    <?php foreach($categorie as $cat): ?>
        <input type="checkbox" name="interessi[]" value="<?= $cat['id_categoria'] ?>"> <?= $cat['nome'] ?><br>
    <?php endforeach; ?>
    <br>
    <button type="submit">Registrati</button>
</form>
<p><a href="login.php">Vai al Login</a></p>