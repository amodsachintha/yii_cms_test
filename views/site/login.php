<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <h1 class="text-center"><?= Html::encode($this->title) ?></h1>

            <p class="text-center">Please fill out the following fields to login:</p>

            <?php $form = ActiveForm::begin([
                'id' => 'login-form',
//                'layout' => 'horizontal',
                'fieldConfig' => [
                    'labelOptions' => ['class' => 'control-label'],
                ],
            ]); ?>

            <?= $form->field($model, 'email')->textInput(['autofocus' => true]) ?>

            <?= $form->field($model, 'password')->passwordInput() ?>

            <?= $form->field($model, 'rememberMe')->checkbox([
            ]) ?>

            <div class="form-group">
                <div align="center">
                    <?= Html::submitButton('Login', ['class' => 'btn btn-primary btn-block', 'name' => 'login-button']) ?>
                </div>
            </div>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
