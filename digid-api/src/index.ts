import 'reflect-metadata';
import { initApplication, initDatabase } from './init';

(async () => {
  const app = initApplication();
  await initDatabase();
  const port = process.env.PORT;

  app.listen(port, () => {
    return console.log(`server is listening on ${port}`);
  });
})();
