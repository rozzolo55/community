<?php
session_start();
if (!isset($_SESSION['id_utente'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

// 1. Recupero solo gli eventi passati (data < oggi)
$sql_passati = "SELECT id_evento, titolo, data FROM evento WHERE data < CURDATE()";
$eventi_passati = $pdo->query($sql_passati)->fetchAll();

// 2. Salvataggio del giudizio
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['invia_voto'])) {
    $id_evento = $_POST['id_evento'];
    $voto = $_POST['voto'];
    $commento = $_POST['commento'];
    $id_utente = $_SESSION['id_utente'];

    if (!empty($id_evento) && !empty($voto)) {
        $stmt = $pdo->prepare("INSERT INTO post (voto, commento, id_evento, id_utente) VALUES (?, ?, ?, ?)");
        $stmt->execute([$voto, $commento, $id_evento, $id_utente]);
        $msg = "Recensione salvata con successo!";
    } else {
        $msg = "Errore: seleziona un evento e un voto.";
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Valuta Evento</title>
</head>
<body>
<p><a href="progettoCommunity.php"><- Torna alla Home</a></p>
<h1>Dai un voto a un evento passato</h1>

<?php if(isset($msg)) echo "<p><strong>$msg</strong></p>"; ?>

<form method="POST">
    <label>Scegli l'evento:</label><br>
    <select name="id_evento" required>
        <option value="">-- Seleziona --</option>
        <?php foreach($eventi_passati as $ev): ?>
            <option value="<?= $ev['id_evento'] ?>"><?= $ev['titolo'] ?> (<?= $ev['data'] ?>)</option>
        <?php endforeach; ?>
    </select>
    <br><br>

    <label>Voto (da 1 a 5):</label><br>
    <input type="number" name="voto" min="1" max="5" required>
    <br><br>

    <label>Commento:</label><br>
    <textarea name="commento" rows="4" cols="30" placeholder="Scrivi qui il tuo giudizio..."></textarea>
    <br><br>

    <button type="submit" name="invia_voto">Invia Giudizio</button>
</form>
</body>
</html>