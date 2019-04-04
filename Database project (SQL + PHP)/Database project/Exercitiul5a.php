<!DOCTYPE html>
<html>
<title>Exercitiul 5a</title>
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

$an=$_POST['an'];
$an=trim($an);

if (!get_magic_quotes_gpc()) {
      $an = addslashes($an);
    }

$user='root';
$pass='';
$host='localhost';
$db_name='colocviufinal';

$conn=mysqli_connect($host,$user,$pass,$db_name);

if(!$conn)
	die("Conectare esuata la baza de date! ".mysqli_connect_error());


$query = "SELECT ap.Adresa as adresa, c.ID_APARTAMENT as idap, c.LUNA as month
FROM Apartament ap JOIN Consum c
ON ap.ID_APARTAMENT = c.ID_APARTAMENT 
WHERE c.AN = '{$an}' AND c.VALOARE IS NOT NULL AND C.VALOARE >= ALL(SELECT VALOARE FROM Consum WHERE AN = '{$an}' AND VALOARE IS NOT NULL)";

if($result = mysqli_query($conn,$query))

{
if((strpos($an, '2017') !== false) or (strpos($an, '2018') !== false) or (strpos($an, '2019') !== false))
$num_results=mysqli_num_rows($result);
else
	$num_results = -1;

if($num_results <0 )
{
echo '</p>';
echo "Year not found! Reveniți la pagina anterioară pentru a accesa un alt an!";
echo '</p>';
}
else if($num_results == 0)
{
echo '</p>';
echo "Nu au fost găsite apartamente care să aibă consum în anul introdus!";
echo '</p>';
}
else if($num_results > 0)
{
	echo 'Aceasta este adresa, numărul de apartament și luna pentru consumul cu cea
mai mare valoare pentru anul introdus: ';
	
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);

      echo '<p><strong>' . ($i + 1) . '. Adresa: ';
      echo htmlspecialchars(stripslashes($row['adresa']));
      echo '</strong><br />ID apartament: ';
      echo stripslashes($row['idap']);
	  echo '</strong><br />Luna: ';
      echo stripslashes($row['month']);
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