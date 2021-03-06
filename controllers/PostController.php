<?php

namespace app\controllers;

use app\models\Category;
use app\models\User;
use Yii;
use app\models\Post;
use app\models\searches\PostSearch;
use yii\validators\ImageValidator;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
use yii\filters\AccessControl;

/**
 * PostController implements the CRUD actions for Post model.
 */
class PostController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],

            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['index','view','create','update','delete'],
                        'roles' => ['content_editor','super_admin'],
                    ],
                    [
                        'allow' => true,
                        'actions' => ['index','view'],
                        'roles' => ['?'],
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Post models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PostSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Post model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Post model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Post();

        if (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post()['Post'];

            $model->user_id = Yii::$app->user->id;
            $model->title = $data['title'];
            $model->content = $data['content'];
            $model->category_id = $data['category_id'];

            //file uploads

            $image = UploadedFile::getInstance($model, 'image');
            $video = UploadedFile::getInstance($model, 'video');

            try{
                if(!is_null($image)){
                    $imageUrl = md5(random_bytes(16)) . '.' . $image->extension;
                    $image->saveAs('uploads/images/' . $imageUrl);
                    $model->image = $imageUrl;
                }

                if(!is_null($video)){
                    $videoUrl = md5(random_bytes(16)) . '.' . $video->extension;
                    $video->saveAs('uploads/videos/' .$videoUrl);
                    $model->video = $videoUrl;
                }
            }catch (\Exception $exception){
                die($exception->getMessage());
            }


            $date = new \DateTime();
            $model->created_at = $date->format('Y-m-d H:i:s');
            $model->updated_at = $date->format('Y-m-d H:i:s');

            if($model->validate()){
                if ($model->save()) {
                    Yii::$app->session->setFlash('success', 'Post created!');
                    return $this->redirect(['index']);
                }
            }else{
                Yii::$app->session->setFlash('danger', 'Validation Failed');
                return $this->redirect(['index']);
            }


        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Post model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post()['Post'];

            $model->user_id = Yii::$app->user->id;
            $model->title = $data['title'];
            $model->content = $data['content'];
            $model->category_id = $data['category_id'];

            //file uploads

            $image = UploadedFile::getInstance($model, 'image');
            $video = UploadedFile::getInstance($model, 'video');

            try{
                if(!is_null($image)){
                    $imageUrl = md5(random_bytes(16)) . '.' . $image->extension;
                    $image->saveAs('uploads/images/' . $imageUrl);
                    $model->image = $imageUrl;
                }

                if(!is_null($video)){
                    $videoUrl = md5(random_bytes(16)) . '.' . $video->extension;
                    $video->saveAs('uploads/videos/' .$videoUrl);
                    $model->video = $videoUrl;
                }
            }catch (\Exception $exception){
                die($exception->getMessage());
            }


            $date = new \DateTime();
            $model->created_at = $date->format('Y-m-d H:i:s');
            $model->updated_at = $date->format('Y-m-d H:i:s');

            if($model->validate()){
                if ($model->save()) {
                    Yii::$app->session->setFlash('success', 'Post Updated!');
                    return $this->redirect(['index']);
                }
            }else{
                Yii::$app->session->setFlash('danger', 'Validation Failed');
                return $this->redirect(['index']);
            }
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Post model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        if(!is_null($model->image)){
            unlink(Yii::$app->basePath . '/web/uploads/images/' .$model->image);
        }
        if(!is_null($model->video)){
            unlink(Yii::$app->basePath . '/web/uploads/videos/' .$model->video);
        }
        Yii::$app->session->setFlash('success',   'Post and Content Deleted!');
        $model->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Post the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
