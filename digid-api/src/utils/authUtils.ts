import jwt from 'jsonwebtoken';
import { Action } from 'routing-controllers';
import { AUTH_HEADER_NAME } from '../constants/commonConstants';
import { CurrentUserSummary } from '../model/UserModel';

export const checkAuthorisation = (action: Action, roles: string[]): boolean => {
  const token = action.request.headers[AUTH_HEADER_NAME];
  if (!token) return false;

  try {
    jwt.verify(token, process.env.JWT_SECRET);
    return !roles.length || roles.includes(decodeToken(token).role);
  } catch (err) {
    return false;
  }
};

export const getCurrentUserSummary = (action: Action): CurrentUserSummary => {
  const token = action.request.headers[AUTH_HEADER_NAME];
  return token && decodeToken(token);
};

const decodeToken = (token: string): CurrentUserSummary => jwt.decode(token) as CurrentUserSummary;
