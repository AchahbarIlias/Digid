import {
  CurrentUserSummary,
  LoginPayload,
  LoginResponse,
  User,
  UserDto,
  UserModel,
} from '../model/UserModel';
import { compare } from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { UnauthorizedError } from 'routing-controllers';
import { mapUserToDto } from '../utils/userUtils';

export default class UserService {
  public loginUser = async (payload: LoginPayload): Promise<LoginResponse> => {
    const user: User = await UserModel.findOne({ userName: payload.username }).lean();
    if (user && (await compare(payload.password, user.password))) {
      const payload: CurrentUserSummary = {
        userId: user._id,
        role: user.role,
      };
      return {
        jwt: jwt.sign(payload, process.env.JWT_SECRET),
      };
    }

    throw new UnauthorizedError('Incorrect username/password');
  };

  public getUserById = async (id: string): Promise<UserDto> =>
    mapUserToDto(await UserModel.findById(id).lean());
}
