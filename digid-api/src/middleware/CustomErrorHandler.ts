import { ExpressErrorMiddlewareInterface, HttpError, Middleware } from 'routing-controllers';
import { Request, Response } from 'express';

@Middleware({ type: 'after' })
export class CustomErrorHandler implements ExpressErrorMiddlewareInterface {
  error(error: Error, request: Request, response: Response, next: (err?: any) => any) {
    if (error instanceof HttpError) {
      response.status((error as HttpError).httpCode);
      response.json({
        message: error.message,
        errors: (error as any).errors,
      });
      next();
    } else {
      response.status(500).json({
        message: 'Unhandled error occurred',
      });
      next(error);
    }
  }
}
