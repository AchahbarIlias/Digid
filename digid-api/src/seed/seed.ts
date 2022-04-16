import { initDatabase } from '../init';
import mongoose from 'mongoose';
import { UserModel, UserRole } from '../model/UserModel';
import { hash } from 'bcryptjs';
import { PASSWORD_SALT_LENGTH } from '../constants/commonConstants';

(async () => {
  await initDatabase();

  const usersExist = await UserModel.exists({});
  if (usersExist) {
    console.log('Terminating seed operation as users already exist');
    return;
  }

  await generateUser(
    'user1',
    'password1',
    'User One',
    '+420 500 696',
    'Disneyland',
    UserRole.Citizen
  );
  await generateUser(
    'user2',
    'password2',
    'User Two',
    '+420 500 700',
    'Slachthuislaan 3',
    UserRole.Citizen
  );
  await generateUser(
    'user3',
    'password3',
    'User Three',
    '+420 500 333',
    'Janseniusstraat 2',
    UserRole.Citizen
  );

  await generateUser(
    'official1',
    'officialpw1',
    'Official One',
    '+420 666 000',
    'Naamsestraat 49',
    UserRole.Official
  );
  await generateUser(
    'official2',
    'officialpw2',
    'Official Two',
    '+420 222 444',
    'Oude Markt 13',
    UserRole.Official
  );
})().then(async () => {
  await mongoose.connection?.close();
});

const generateUser = async (userName, password, fullName, phoneNumber, address, role) => {
  const user = new UserModel({
    userName: userName,
    email: `${userName}@gmail.com`,
    password: await hash(password, PASSWORD_SALT_LENGTH),
    fullName: fullName,
    phoneNumber: phoneNumber,
    address: address,
    nationality: 'Belgian',
    placeOfBirth: 'Leuven',
    dayOfBirth: new Date(1995, 11, 17),
    role: role,
  });

  await user.save();
};
