<?php

/* @var $this yii\web\View */

$this->title = 'SCMA CMS';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>SCMA CMS</h1>

        <p class="lead">SCMA Student Handbook CMS and API</p>
        <?php if (Yii::$app->user->isGuest): ?>
            <p><a class="btn btn-lg btn-success" href="<?= \yii\helpers\Url::to('site/login') ?>">Login to Continue</a></p>
        <?php endif; ?>


    </div>

    <?php if (Yii::$app->user->isGuest): ?>
        guest
        <div class="body-content">

            <div class="row">
                <div class="col-lg-4">
                    <h2>Heading</h2>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                        fugiat nulla pariatur.</p>

                    <p><a class="btn btn-default" href="http://www.yiiframework.com/doc/">Yii Documentation &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <h2>Heading</h2>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                        fugiat nulla pariatur.</p>

                    <p><a class="btn btn-default" href="http://www.yiiframework.com/forum/">Yii Forum &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <h2>Heading</h2>

                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
                        dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
                        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                        fugiat nulla pariatur.</p>

                    <p><a class="btn btn-default" href="http://www.yiiframework.com/extensions/">Yii Extensions &raquo;</a></p>
                </div>
            </div>

        </div>
    <?php else: ?>
        loggedin
        <div class="body-content">

            <div class="row">
                <div class="col-lg-4">
                    <h2>View Content</h2>

                    <p>View Posts in the SCMA CMS.</p>

                    <p><a class="btn btn-default" href="<?= \yii\helpers\Url::to('post/index') ?>">View Posts &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <h2>Add New Content</h2>

                    <p>Create Content</p>

                    <p><a class="btn btn-default" href="http://www.yiiframework.com/forum/">Yii Forum &raquo;</a></p>
                </div>
                <div class="col-lg-4">
                    <?php if (Yii::$app->user->can('manageUsers')): ?>
                        <h2>Manage CMS Users</h2>
                        <p>Manage Accounts and profile</p>
                        <p><a class="btn btn-default" href="<?= \yii\helpers\Url::to('users/index') ?>">Manage Users &raquo;</a>
                        <a class="btn btn-default" href="#">Manage Profile &raquo;</a></p>
                    <?php else: ?>
                        <h2>Manage Profile</h2>
                        <p>Manage Account</p>
                        <p><a class="btn btn-default" href="#">Manage Profile &raquo;</a></p>
                    <?php endif; ?>
                </div>
            </div>

        </div>
    <?php endif; ?>


</div>
