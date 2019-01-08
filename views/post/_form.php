<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\models\Category;
use kartik\file\FileInput;

/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?=
    $form->field($model, 'category_id')->widget(Select2::classname(), [
        'data' => ArrayHelper::map(Category::find()->asArray()->all(), 'id', 'title'),
        'options' => ['placeholder' => 'Select a Category'],
        'pluginOptions' => [
            'allowClear' => true
        ],
    ])
    ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'content')->textarea(['rows' => 10]) ?>


    <div class="row">
        <div class="col-md-6">
            <?= $form->field($model, 'image')->widget(FileInput::classname(), [
                'options' => ['accept' => 'image/*'],
                'pluginOptions' => [
                    'showUpload' => false,
                    'showCancel' => false,
                    'browseIcon' => '<i class="glyphicon glyphicon-camera"></i> ',
                    'browseLabel' =>  'Select Image'
                ]
            ]);
            ?>
        </div>
        <div class="col-md-6">
            <?= $form->field($model, 'video')->widget(FileInput::classname(), [
                'options' => ['accept' => 'video/mp4'],
                'pluginOptions' => [
//            'showPreview' => false,
                    'showUpload' => false,
                    'showCancel' => false,
                    'browseIcon' => '<i class="glyphicon glyphicon-hd-video"></i> ',
                    'browseLabel' =>  'Select Video'
                ]
            ]);
            ?>
        </div>
    </div>






    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success btn-block']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
