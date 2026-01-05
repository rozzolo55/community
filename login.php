<?php
session_start();
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nick = $_POST['nickname'];
    $pass_md5 = md5($_POST['password']);

    $stmt = $pdo->prepare("SELECT * FROM utente WHERE nickname = ? AND password = ?");
    $stmt->execute([$nick, $pass_md5]);
    $utente = $stmt->fetch();

    if ($utente) {
        $_SESSION['id_utente'] = $utente['id_utente'];
        $_SESSION['nickname'] = $utente['nickname'];
        // Reindirizzamento al nome esatto del tuo file
        header("Location: progettoCommunity.php");
        exit();
    } else {
        $errore = "Dati non validi!";
    }
}
?>
    <form method="POST">
        <input type="text" name="nickname" placeholder="Nickname" required><br>
        <input type="password" name="password" placeholder="Nickname (come password)" required><br>
        <button type="submit">Accedi</button>
    </form>
<?php if(isset($errore)) echo $errore; ?>