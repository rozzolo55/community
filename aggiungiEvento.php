<?php
session_start();
// Controllo sicurezza: se l'utente non è loggato, non può aggiungere eventi
if (!isset($_SESSION['id_utente'])) {
    header("Location: login.php");
    exit();
}

include 'db.php'; // Usa la tua connessione centralizzata

// 1. Recupero le categorie dal database per il menu a tendina
$stmt_cat = $pdo->query("SELECT * FROM categoria");
$categorie = $stmt_cat->fetchAll();

// 2. Logica di inserimento
if (isset($_POST['send'])) {
    if (empty($_POST['titolo']) || empty($_POST['data']) || empty($_POST['luogo']) || empty($_POST['id_categoria'])) {
        $messaggio = "Errore: Compilare tutti i campi.";
    } else {
        try {
            // Prendiamo l'ID utente dalla sessione (sicurezza)
            $id_utente_loggato = $_SESSION['id_utente'];

            $sql = "INSERT INTO evento (titolo, data, luogo, id_categoria, id_utente) 
                    VALUES (:titolo, :data, :luogo, :id_categoria, :id_utente)";

            $stmt = $pdo->prepare($sql);
            $stmt->execute([
                ':titolo'       => $_POST['titolo'],
                ':data'         => $_POST['data'],
                ':luogo'        => $_POST['luogo'],
                ':id_categoria' => $_POST['id_categoria'],
                ':id_utente'    => $id_utente_loggato
            ]);

            $messaggio = "Evento aggiunto con successo!";
        } catch (PDOException $e) {
            $messaggio = "Errore database: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Aggiungi Evento</title>
</head>
<body>

<p><a href="progettoCommunity.php"><- Torna alla Home</a></p>

<form method="post">
    <h1>Aggiungi un nuovo evento</h1>

    <?php if(isset($messaggio)) echo "<p><strong>$messaggio</strong></p>"; ?>

    <label>Titolo:</label><br>
    <input type="text" name="titolo" required><br><br>

    <label>Data:</label><br>
    <input type="date" name="data" required><br><br>

    <label>Luogo:</label><br>
    <input type="text" name="luogo" required><br><br>

    <label>Categoria:</label><br>
    <select name="id_categoria" required>
        <option value="">-- Seleziona --</option>
        <?php foreach($categorie as $cat): ?>
            <option value="<?= $cat['id_categoria'] ?>"><?= $cat['nome'] ?></option>
        <?php endforeach; ?>
    </select><br><br>

    <p>Creato dall'utente: <strong><?= $_SESSION['nickname'] ?></strong></p>

    <input type="submit" name="send" value="Salva Evento"/>
</form>

</body>
</html>