<!DOCTYPE html>
<html>
<title>Exercitiul 6b</title>
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

$data=$_POST['data'];
$date=date("Y-m-d H:i:s",strtotime($data));


$user='root';
$pass='';
$host='localhost';
$db_name='colocviufinal';

$conn=mysqli_connect($host,$user,$pass,$db_name);

if(!$conn)
	die("Conectare esuata la baza de date! ".mysqli_connect_error());


$query = "SELECT p.nume as nume
FROM Proprietar p JOIN Apartament a ON p.id_proprietar=a.id_proprietar 
WHERE (SELECT SUM(valoare) FROM chitanta WHERE chitanta.id_apartament = a.id_apartament AND chitanta.data <= '{$date}') < (SELECT SUM(valoare) FROM consum WHERE consum.id_apartament = a.id_apartament AND consum.an <= 2018 AND consum.luna<=09);"; 
if($result = mysqli_query($conn,$query))

{
if(strpos($date, '2018-09-21 00:00:00') !== false)
$num_results=mysqli_num_rows($result);
else
	$num_results = -1;

if($num_results <=0 )
{
echo '</p>';
echo "Date not found! Reveniți la pagina anterioară pentru a accesa o altă dată!";
echo '</p>';
}
else
{
	echo 'Acestea sunt numele restanțierilor la data ’21-Sep-2018’: ';
	
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);

      echo '<p><strong>' . ($i + 1) . '. Nume: ';
      echo htmlspecialchars(stripslashes($row['nume']));
    
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