<?php

use yii\helpers\Html;

$this->title = 'All Posts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-docs">

    <h1><?= Html::encode($this->title) ?></h1>

    <div class="row">

    </div>

    <?php foreach (\app\models\Post::find()->orderBy(['post.created_at'=>SORT_DESC])->all() as $post) {
        $created = Yii::$app->formatter->asDate($post->created_at);
        $content = Yii::$app->formatter->asHtml(str_split($post->content, 600)[0]);
        $id = $post->id;
        $user = $post->user->name;
        echo "<div class='row panel panel-default'>
                    <div class='panel-heading'>
                        <h2>$post->title</h2>
                    </div>
                  <div class='panel-body'>
                  <p >$content</p>
                </div>
                  <div class='panel-footer'>
                    <div class='row'>
                    <div class='col-sm-4'><small>$created </small> </div>
                    <div class='col-sm-4'><i class='glyphicon glyphicon-user'></i> $user</div>
                    <div class='col-sm-4'> <p class='pull-right'><a class='btn btn-default btn-sm' href='/post/view?id=$id'>Read More &raquo;</a></p> </div>
</div>
                       
                       
                      
                </div>
                   
                </div>";
    }

    ?>

    <div class="row">

    </div>

</div>
