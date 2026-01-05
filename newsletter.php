<?php
session_start();
if (!isset($_SESSION['id_utente'])) {
    header("Location: login.php");
    exit();
}

include 'db.php';

// 1. Recupero il paese dell'utente loggato
$stmt_user = $pdo->prepare("SELECT paese FROM utente WHERE id_utente = ?");
$stmt_user->execute([$_SESSION['id_utente']]);
$utente = $stmt_user->fetch();
$paese_utente = $utente['paese'];

// 2. Query per gli eventi nel territorio entro 7 giorni
// Usiamo CURDATE() per la data odierna e DATE_ADD per calcolare tra una settimana
$sql = "SELECT titolo, data, luogo 
        FROM evento 
        WHERE luogo = ? 
        AND data BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
        ORDER BY data ASC";

$stmt_events = $pdo->prepare($sql);
$stmt_events->execute([$paese_utente]);
$eventi = $stmt_events->fetchAll();
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Newsletter Eventi</title>
</head>
<body>

<p><a href="progettoCommunity.php"><- Torna alla Home</a></p>

<h1>Eventi in programma nel tuo territorio (<?php echo $paese_utente; ?>)</h1>
<p>Eventi previsti per la prossima settimana:</p>

<table border="1" cellpadding="10">
    <thead>
    <tr>
        <th>Evento</th>
        <th>Data</th>
        <th>Luogo</th>
    </tr>
    </thead>
    <tbody>
    <?php if (count($eventi) > 0): ?>
        <?php foreach ($eventi as $ev): ?>
            <tr>
                <td><?php echo $ev['titolo']; ?></td>
                <td><?php echo $ev['data']; ?></td>
                <td><?php echo $ev['luogo']; ?></td>
            </tr>
        <?php endforeach; ?>
    <?php else: ?>
        <tr>
            <td colspan="3" align="center">
                Non ci sono eventi in programma nel tuo territorio entro la prossima settimana.
            </td>
        </tr>
    <?php endif; ?>
    </tbody>
</table>

</body>
</html>
