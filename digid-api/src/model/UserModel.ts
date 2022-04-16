import { model, Schema } from 'mongoose';
import { IsNotEmpty } from 'class-validator';

export enum UserRole {
  Citizen = 'Citizen',
  Official = 'Official',
}

export class LoginPayload {
  @IsNotEmpty()
  username: string;
  @IsNotEmpty()
  password: string;
}

export interface LoginResponse {
  jwt: string;
}

export interface CurrentUserSummary {
  userId: string;
  role: UserRole;
}

export interface UserDto {
  username: string;
  email: string;
  fullName: string;
  phoneNumber: string;
  address: string;
  nationality: string;
  dayOfBirth: Date;
  placeOfBirth: string;
}

export interface User {
  _id: string;
  userName: string;
  email: string;
  password: string;
  fullName: string;
  phoneNumber: string;
  address: string;
  nationality: string;
  dayOfBirth: Date;
  placeOfBirth: string;
  role: UserRole;
}

const userSchema = new Schema<User>({
  userName: { type: String, required: true, unique: true, index: true },
  email: { type: String, required: true, unique: true, index: true },
  password: { type: String, required: true },
  fullName: { type: String, required: true },
  phoneNumber: { type: String, required: true },
  address: { type: String, required: true },
  nationality: { type: String, required: true },
  placeOfBirth: { type: String, required: true },
  dayOfBirth: { type: Date, required: true },
  role: { type: String, required: true, default: UserRole.Citizen, enum: Object.values(UserRole) },
});

export const UserModel = model<User>('User', userSchema);
