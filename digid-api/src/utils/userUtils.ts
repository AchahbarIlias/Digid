import { User, UserDto } from '../model/UserModel';

export const mapUserToDto = (user: User): UserDto => ({
  username: user.userName,
  email: user.email,
  fullName: user.fullName,
  phoneNumber: user.phoneNumber,
  address: user.address,
  nationality: user.nationality,
  dayOfBirth: user.dayOfBirth,
  placeOfBirth: user.placeOfBirth,
});
