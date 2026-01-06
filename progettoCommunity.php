<?php
session_start();

// Controllo se l'utente è loggato
if (!isset($_SESSION['id_utente'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Area Riservata</title>
</head>
<body>

<p>Benvenuto, <?php echo $_SESSION['nickname']; ?></p>

<form action="aggiungiEvento.php" style="display: inline;">
    <button type="submit">Crea un nuovo evento</button>
</form>

<form action="newsletter.php" style="display: inline;">
    <button type="submit">Visualizza Newsletter</button>
</form>

<form action="votaEvento.php" style="display: inline;">
    <button type="submit">Valuta Evento Passato</button>
</form>

<form action="visualizzaEvento.php" style="display: inline;">
    <button type="submit">Visualizza gli eventi</button>
</form>

<form action="visualizzaCommenti.php" style="display: inline;">
    <button type="submit">Visualizza i commenti</button>
</form>

<br><br>

<h3>I tuoi Interessi:</h3>
<ul>
    <?php
    $stmt = $pdo->prepare("SELECT c.nome FROM categoria c 
                               JOIN interessi i ON c.id_categoria = i.id_categoria 
                               WHERE i.id_utente = ?");
    $stmt->execute([$_SESSION['id_utente']]);
    while($row = $stmt->fetch()) {
        echo "<li>" . $row['nome'] . "</li>";
    }
    ?>
</ul>

<p><a href="logout.php">Esci</a></p>

</body>
</html>
