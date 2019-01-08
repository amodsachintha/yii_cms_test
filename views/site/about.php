<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'About';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        This is the SCMA Content Management System that drives the SCMA API.
    </p>

    <p>
        To access the api,
    </p>
    <ul>
        <li>All Posts: <a href="/api/post" class="btn btn-primary btn-sm" target="_blank">All Posts</a> </li>
        <li> - </li>
        <li>Single Post: <a href="/api/post/view?id=2" class="btn btn-primary btn-sm" target="_blank">Single Post</a> </li>
    </ul>
</div>
