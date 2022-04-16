import { Authorized, Body, Controller, CurrentUser, Get, Post } from 'routing-controllers';
import {
  CurrentUserSummary,
  LoginPayload,
  LoginResponse,
  UserDto,
} from '../model/UserModel';
import UserService from '../service/UserService';

@Controller('/user')
export class UserController {
  private userService: UserService;

  constructor() {
    this.userService = new UserService();
  }

  @Post('/login')
  login(@Body({ required: true }) payload: LoginPayload): Promise<LoginResponse> {
    return this.userService.loginUser(payload);
  }

  @Get()
  @Authorized()
  getUser(@CurrentUser({ required: true }) user: CurrentUserSummary): Promise<UserDto> {
    return this.userService.getUserById(user.userId);
  }
}
