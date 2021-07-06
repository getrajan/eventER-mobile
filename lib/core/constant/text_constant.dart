import 'dart:core';

const String emailReg =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

const String UNKNOWN_ERROR = "Unknown Error";
const String NO_INTERNET_ERROR = "No Internet Connection";
const String HIVE_USER = "user_hive";
const String HIVE_SESSION = "session_hive";
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String CACHE_SUCCESS_MESSAGE = "Cache Success";
const String TOKEN_EXPIRE_MESSAGE = "Token is expire. Please login again";
