<!DOCTYPE html>
<html>
<title>Exercitiul 4b</title>
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

$adresa=$_POST['adresa'];
$adresa=trim($adresa);
$year=$_POST['year'];
$year=trim($year);
$month=$_POST['month'];
$month=trim($month);

if (!get_magic_quotes_gpc()) {
      $adresa = addslashes($adresa);
	  $year = addslashes($year);
	  $month = addslashes($month);
    }

$user='root';
$pass='';
$host='localhost';
$db_name='colocviufinal';

$conn=mysqli_connect($host,$user,$pass,$db_name);

if(!$conn)
	die("Conectare esuata la baza de date! ".mysqli_connect_error());


$query = "SELECT ap.ADRESA as adresa, ap.NR_APARTAMENT as nrap, ap.ID_PROPRIETAR as idprop, c.VALOARE as val
FROM Apartament ap JOIN Consum c
ON (ap.ID_APARTAMENT = c.ID_APARTAMENT)
WHERE ap.ADRESA = '{$adresa}' AND c.AN = '{$year}' AND c.LUNA = '{$month}'"; 

if($result = mysqli_query($conn,$query))
	$num_results=mysqli_num_rows($result);
else
	$num_results = -1;

if($num_results < 0 )
{
echo '</p>';
echo "Adress not found! Reveniți la pagina anterioară pentru a accesa o altă adresă!";
echo '</p>';
}
else 
	if($num_results == 0)
{
	echo '</p>';
	echo "Nu a fost găsită nicio listă de cheltuieli pentru anul, luna și adresa căutată!";
	echo '</p>';
}
else if($num_results > 0)
{
	echo 'Aceasta este lista de cheltuieli pentru adresa, anul și luna căutată: ';
	
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);

      echo '<p><strong>' . ($i + 1) . '. Adresa: ';
      echo htmlspecialchars(stripslashes($row['adresa']));
      echo '</strong><br />Numar apartament ';
      echo stripslashes($row['nrap']);
	  echo '</strong><br />ID proprietar: ';
      echo stripslashes($row['idprop']);
	  echo '</strong><br />Valoare: ';
      echo stripslashes($row['val']);
      echo '</p>';
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