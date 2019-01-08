<?php

/* @var $this \yii\web\View */

/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

//AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/site.css">
    <!-- /css/sandstone.min.css -->
    <link rel="stylesheet" href="/css/sandstone.min.css">
    <link rel="stylesheet" href="/css/viewer.min.css">

    <!-- jQuery library -->
<!--    <script src="/js/jquery.min.js"></script>-->
<!--    <script src="/js/jquery-3.3.1.min.js"></script>-->
    <!-- Latest compiled JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/tinymce/tinymce.min.js"></script>

    <script src="/js/viewer.min.js"></script>
    <script>tinymce.init({
            selector:'textarea',
            plugins : 'advlist autolink link lists print preview',
        });</script>
</head>
<body>
<?php $this->beginBody() ?>
<div class="container" style="margin-top: 15px">
    <?php
    NavBar::begin([
        'brandLabel' => 'SCMA CMS',
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-default',
            'style' => 'border:none; box-shadow: 2px 12px 9px -12px rgba(133,133,133,1);'
        ],
        'innerContainerOptions' => ['class' => 'container-fluid',]
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            ['label' => 'Home', 'url' => ['/site/index']],
            ['label' => 'Posts', 'url' => ['/site/posts']],
            ['label' => 'About', 'url' => ['/site/about']],
            ['label' => 'Contact', 'url' => ['/site/contact']],
            Yii::$app->user->isGuest ? (
            ['label' => 'Login', 'url' => ['/site/login']]
            ) : (
                '<li>'
                . Html::beginForm(['/site/logout'], 'post')
                . Html::submitButton(
                    'Logout (<i class="glyphicon glyphicon-user"></i> ' . Yii::$app->user->identity->name . ')',
                    ['class' => 'btn btn-link logout']
                )
                . Html::endForm()
                . '</li>'
            )
        ],
    ]);
    NavBar::end();
    ?>
</div>
<div class="wrap">


        <div class="container">
            <?= Breadcrumbs::widget([
                'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
            ]) ?>
            <?= Alert::widget() ?>
            <?= $content ?>
        </div>
    </div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; SCMA CMS <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
