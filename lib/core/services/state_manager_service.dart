import 'dart:convert';

import 'package:real_state/core/constants/app_strings.dart';
import 'package:real_state/core/enums/general_states.dart';
import 'package:real_state/core/helpers/exception.dart';
import 'package:real_state/core/helpers/failures.dart';
import 'package:real_state/core/services/status_showing_service.dart';
import 'package:real_state/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

abstract class StateManagerService {
  static Unit getExceptionStatusCode(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
        return unit;
      case 400:
      case 422:
      case 403:
        Map body = json.decode(response.body);
        var data = body.containsKey('message') ? body['message'] : AppStrings.unexpectedException;
        String message = AppStrings.unexpectedException;
        if (data is String) message = data;
        Logger().w(json.decode(response.body));
        throw BadRequestException(message: message);
      case 401:
        throw UnAuthorizedException();
      // case 401:
      //   throw UnAuthenticatedException();
      case 404:
        throw NotFoundException();
      case 500:
        throw InternalServerErrorException();
      default:
        throw UnexpectedException();
    }
  }

  static Failure getFailureFromException(Object exception) {
    if (exception is BadRequestException) {
      return BadRequestFailure(message: exception.message);
    } else if (exception is UnAuthenticatedException) {
      return const UnAuthenticatedFailure(message: AppStrings.forbidden);
    } else if (exception is UnAuthorizedException) {
      return const UnAuthorizedFailure(message: AppStrings.unauthorized);
    } else if (exception is NotFoundException) {
      return const NotFoundFailure(message: AppStrings.notFound);
    } else if (exception is InternalServerErrorException) {
      return const InternalServerErrorFailure(
        message: AppStrings.internalServerError,
      );
    } else if (exception is OfflineException) {
      return const OfflineFailure(message: AppStrings.offline);
    } else {
      InjectionContainer.getIt<Logger>().e(
        "End `getFailureFromException` Exception: ${exception.toString()}",
      );
      return const UnexpectedFailure(
        message: AppStrings.unexpectedException,
      );
    }
  }

  static GeneralStates getStateFromFailure(Failure failure) {
    if (failure is OfflineFailure) {
      StatusShowingService.showOfflineError();
      return GeneralStates.offline;
    }
    if (failure is BadRequestFailure) {
      StatusShowingService.showError(message: failure.message);
      return GeneralStates.badRequest;
    }
    if (failure is UnAuthenticatedFailure) {
      // StatusShowingService.showError(
      //   message: AppStrings.forbidden,
      //   durationSeconds: 8,
      // );
      return GeneralStates.forbidden;
    }
    if (failure is UnAuthorizedFailure) {
      // StatusShowingService.showError(
      //   message: AppStrings.unauthorized,
      //   durationSeconds: 8,
      // );
      return GeneralStates.unAuthorized;
    }
    if (failure is NotFoundFailure) {
      // StatusShowingService.showError(
      //   message: AppStrings.notFound,
      // );
      return GeneralStates.notFound;
    }
    if (failure is InternalServerErrorFailure) {
      StatusShowingService.showInternalServerError();
      return GeneralStates.internalServerProblem;
    }
    StatusShowingService.showError(
      message: AppStrings.unexpectedException,
    );
    return GeneralStates.unexpectedProblem;
  }
}
