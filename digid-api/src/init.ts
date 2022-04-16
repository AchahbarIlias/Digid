import express from 'express';
import bodyParser from 'body-parser';
import { config as configEnv } from 'dotenv';
import { useExpressServer } from 'routing-controllers';
import { connect } from 'mongoose';
import { CustomErrorHandler } from './middleware/CustomErrorHandler';
import { UserController } from './controllers/UserController';
import { checkAuthorisation, getCurrentUserSummary } from './utils/authUtils';

export const initApplication = () => {
  configEnv();

  const app = express();
  app.use(bodyParser.json());
  useExpressServer(app, {
    controllers: [UserController],
    middlewares: [CustomErrorHandler],
    routePrefix: process.env.API_PATH_ROOT,
    defaultErrorHandler: false,
    authorizationChecker: checkAuthorisation,
    currentUserChecker: getCurrentUserSummary,
  });
  return app;
};

export const initDatabase = async () => {
  await connect(process.env.CONNECTION_STRING || 'mongodb://localhost:27017/master');
};
