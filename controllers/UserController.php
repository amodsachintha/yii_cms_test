<?php

namespace app\controllers;

use Yii;
use app\models\User;
use app\models\searches\UserSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \DateTime;
use HttpInvalidParamException;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
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
        ];
    }

    /**
     * Lists all User models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $model->password = "********";
        return $this->render('view', [
            'model' => $model,
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new User();

        if (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post()['User'];
            $role = Yii::$app->request->post()['AuthItem']['name'];
            try {
                $data['password'] = Yii::$app->getSecurity()->generatePasswordHash($data['password']);
            } catch (\Exception $exception) {
                return $exception->getMessage();
            }

            $model->email = $data['email'];
            $model->password = $data['password'];
            $model->name = $data['name'];

            $date = new DateTime();
            $model->created_at = $date->format('Y-m-d H:i:s');
            $model->updated_at = $date->format('Y-m-d H:i:s');

            if ($model->save()) {
                $auth = \Yii::$app->authManager;
                $authorRole = $auth->getRole($role);
                try {
                    $auth->assign($authorRole, $model->getId());
                } catch (\Exception $exception) {
                    return new HttpInvalidParamException("Failed to assign role!");
                }
                Yii::$app->session->setFlash('success',   'User created!');
                return $this->redirect(['index']);
            }
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->password = null;

        if (Yii::$app->request->isPost) {
            $data = Yii::$app->request->post()['User'];
            $role = Yii::$app->request->post()['AuthItem']['name'];
            try {
                $data['password'] = Yii::$app->getSecurity()->generatePasswordHash($data['password']);
            } catch (\Exception $exception) {
                return $exception->getMessage();
            }

            $model->email = $data['email'];
            $model->password = $data['password'];
            $model->name = $data['name'];

            $date = new DateTime();
            $model->updated_at = $date->format('Y-m-d H:i:s');

            if ($model->save()) {
                $auth = \Yii::$app->authManager;
                $currentRoles = $auth->getRolesByUser($model->getId());
                foreach ($currentRoles as $currentRole){
                    $auth->revoke($currentRole,$model->getId());
                }
                $authorRole = $auth->getRole($role);
                try {
                    $auth->assign($authorRole, $model->getId());
                } catch (\Exception $exception) {
                    return new HttpInvalidParamException("Failed to assign role!");
                }
                Yii::$app->session->setFlash('success',   'User updated!');
                return $this->redirect(['index']);
            }

        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
