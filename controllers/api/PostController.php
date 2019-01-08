<?php

namespace app\controllers\api;

use app\models\Post;
use yii\web\Response;
use Yii;

class PostController extends \yii\web\Controller
{
    public function actionIndex()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        return Post::find()
            ->asArray()
            ->all();
    }

    public function actionView($id){
        Yii::$app->response->format = Response::FORMAT_JSON;
        return Post::findOne($id);

    }

}
