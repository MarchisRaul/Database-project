<!DOCTYPE html>
<html>
<title>Exercitiul 3b</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" href="http://example.com/favicon.png">
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<script>
function goBack() {
  window.history.back();
}
</script>
<body>

<!-- !PAGE CONTENT! -->
<div class="w3-content" style="max-width:1500px">

<!-- Header -->
<header class="w3-panel w3-center w3-opacity" style="padding:128px 16px">

  
  

  



<?php

$limitainf=$_POST['limitainf'];
$limitainf=trim($limitainf);
$limitasup=$_POST['limitasup'];
$limitasup=trim($limitasup);

if (!get_magic_quotes_gpc()) {
      $limitainf = addslashes($limitainf);
	  $limitasup = addslashes($limitasup);
    }



$user='root';
$pass='';
$host='localhost';
$db_name='colocviufinal';

$conn=mysqli_connect($host,$user,$pass,$db_name);

if(!$conn)
	die("Conectare esuata la baza de date! ".mysqli_connect_error());


$query = "SELECT * FROM Apartament WHERE SUPRAFATA BETWEEN '{$limitainf}' AND '{$limitasup}'
ORDER BY ADRESA DESC";

if($result = mysqli_query($conn,$query))

{
$num_results=mysqli_num_rows($result);

if($num_results <0 )
{
echo '</p>';
echo "Data not found!";
echo '</p>';
}
else if($num_results == 0)
{
echo '</p>';
echo "Nu există apartamente cu suprafața între limitele căutate!";
echo '</p>';
}
else
{
	echo 'Acestea sunt apartamentele cu suprafața(mp) între limitele căutate, în ordinea
descrescătoare a adresei.';
	
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);

      echo '<p><strong>' . ($i + 1) . '. Id apartament: ';
      echo htmlspecialchars(stripslashes($row['id_apartament']));
      echo '</strong><br />Adresa: ';
      echo stripslashes($row['adresa']);
	  echo '</strong><br />Numar apartament: ';
      echo stripslashes($row['nr_apartament']);
	  echo '</strong><br />Suprafata(m²): ';
      echo stripslashes($row['suprafata']);
	  echo '</strong><br />Id proprietar: ';
      echo stripslashes($row['id_proprietar']);
      echo '</p>';
    }
	
}
}

mysqli_close($conn);
?>

 <input type="button" value="Go back" onclick="history.back()">

</header>

              
<!-- End Page Content -->
</div>

</body>
</html>