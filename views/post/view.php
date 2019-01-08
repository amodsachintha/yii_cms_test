<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Post */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="post-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'label' => 'Author',
                'value' => $model->user->name
            ],
            [
                'label' => 'Category',
                'value' => $model->category->title
            ],
            'title',
            'content:html',
            [
                'label' => 'Image',
                'value' => Html::a($model->image,'/uploads/images/'.$model->image),
                'format' => 'html'
            ],

//            'image',
            'video',
            'created_at:datetime',
            'updated_at:datetime',
        ],
    ]) ?>
    <div class="row">
        <?php if (isset($model->image)): ?>
            <div class="col-md-6">
                <ul id="image" class="clearfix">
                    <li><img src="/uploads/images/<?= $model->image ?>" class="img-thumbnail" width="200"></li>
                </ul>

                <script>
                    const gallery = new Viewer(document.getElementById('image'), {
                        backdrop: true
                    });
                </script>
            </div>
        <?php endif; ?>

        <?php if (isset($model->video)): ?>
            <div class="col-md-6">
                <?php
                echo \wbraganca\videojs\VideoJsWidget::widget([
                    'options' => [
                        'class' => 'video-js vjs-default-skin vjs-big-play-centered',
                        'controls' => true,
                        'preload' => 'auto',
                'width' => '970',
                'height' => '400',
                    ],
                    'tags' => [
                        'source' => [
                            ['src' => '/uploads/videos/' . $model->video, 'type' => 'video/mp4'],
                        ],
                    ]
                ]);
                ?>
            </div>

        <?php endif; ?>

    </div>


</div>
