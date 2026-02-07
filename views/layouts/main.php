<?php
$pageTitle = isset($title) ? $title : 'Vite Gourmand';
$headerPath = __DIR__ . '/../partials/header.php';
$footerPath = __DIR__ . '/../partials/footer.php';
?>
<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><?php echo htmlspecialchars($pageTitle, ENT_QUOTES, 'UTF-8'); ?></title>
	</head>
	<body>
		<?php if (file_exists($headerPath)) {
			require $headerPath;
		} ?>

		<main>
			<?php echo $content ?? ''; ?>
		</main>

		<?php if (file_exists($footerPath)) {
			require $footerPath;
		} ?>
	</body>
 </html>


