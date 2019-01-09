<?php

use yii\db\Expression;

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
        <div class="body-content">

            <div class="row">
                <?php foreach (\app\models\Post::find()->orderBy(new Expression('rand()'))->limit(3)->all() as $post) {
                    $created = Yii::$app->formatter->asDate($post->created_at);
                    $content = Yii::$app->formatter->asHtml(str_split($post->content, 70)[0]);
                    echo "<div class='col-lg-4'>
                    <h2>$post->title</h2>
                    <small>$created</small>
                    <p >$content</p>
                    <p><a class='btn btn-default' href='#'>Read More &raquo;</a></p>
                </div>";
                }

                ?>
            </div>

        </div>
    <?php else: ?>
    <?php
    $roles = Yii::$app->authManager->getRolesByUser(Yii::$app->user->id);
    $role = array_pop($roles)->name;
    if (strcmp($role, "super_admin") == 0) {
        echo "<div class='alert alert-danger text-center'>
                You are logged in as <strong>Super Admin.</strong>
            </div>";
    } else {
        echo "<div class='alert alert-warning text-center'>
                You are logged in as <strong>Content Editor.</strong>
            </div>";
    }
    ?>

</div>
    <div class="body-content">

        <div class="row text-center">
            <div class="col-lg-4">
                <div class="panel panel-default" style="box-shadow: 2px 12px 30px -12px rgba(133,133,133,1);">
                    <div class="panel-heading">
                        <h2>View Content</h2>
                    </div>
                    <div class="panel-body">
                        <p>View Posts in the SCMA CMS.</p>
                    </div>
                    <div class="panel-footer">
                        <p>
                            <a class="btn btn-default" href="<?= \yii\helpers\Url::to('post/index') ?>">View Posts &raquo;</a>
                            <a class="btn btn-default" href="<?= \yii\helpers\Url::to('category/index') ?>">View Categories &raquo;</a>
                        </p>
                    </div>

                </div>
            </div>
            <div class="col-lg-4 pull-right">
                <div class="panel panel-default" style="box-shadow: 2px 12px 30px -12px rgba(133,133,133,1);">
                    <div class="panel-heading">
                        <h2>Add New Content</h2>
                    </div>
                    <div class="panel-body">
                        <p>Create Content</p>
                    </div>
                    <div class="panel-footer">
                        <p>
                            <a class="btn btn-default" href="<?= \yii\helpers\Url::to('post/create') ?>">Create Post &raquo;</a>
                            <a class="btn btn-default" href="<?= \yii\helpers\Url::to('category/create') ?>">Create Category &raquo;</a>
                        </p>
                    </div>
                </div>
            </div>
            <?php if (Yii::$app->user->can('manageUsers')): ?>
                <div class="col-lg-4">
                    <div class="panel panel-warning" style="box-shadow: 2px 12px 30px -12px rgba(133,133,133,1);">

                        <div class="panel-heading">
                            <h2>Manage CMS Users</h2>
                        </div>
                        <div class="panel-body">
                            <p>Manage Accounts and profile</p>
                        </div>
                        <div class="panel-footer">
                            <p>
                                <a class="btn btn-default" href="<?= \yii\helpers\Url::to('user/index') ?>">Manage Users &raquo;</a>
                            </p>
                        </div>
                    </div>
                </div>
            <?php else: ?>
<!--                <div class="col-lg-4">-->
<!--                    <div class="panel panel-default" style="box-shadow: 2px 12px 30px -12px rgba(133,133,133,1);">-->
<!--                        <div class="panel-heading">-->
<!--                            <h2>Manage Profile</h2>-->
<!--                        </div>-->
<!--                        <div class="panel-body">-->
<!--                            <p>Manage Account</p>-->
<!--                        </div>-->
<!--                        <div class="panel-footer">-->
<!--                            <p><a class="btn btn-default" href="#">Manage Profile &raquo;</a></p>-->
<!--                        </div>-->
<!--                    </div>-->
<!--                </div>-->
            <?php endif; ?>
        </div>

    </div>
<?php endif; ?>


</div>
