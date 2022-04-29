///
//  Generated code. Do not modify.
//  source: calendar.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'calendar.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'calendar.pb.dart';

class CalendarClient extends $grpc.Client {
  static final _$createEvent =
      $grpc.ClientMethod<$0.CreateEventRequest, $0.Event>(
          '/Calendar/CreateEvent',
          ($0.CreateEventRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Event.fromBuffer(value));
  static final _$listenForEvents = $grpc.ClientMethod<$1.Empty, $0.Event>(
      '/Calendar/ListenForEvents',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Event.fromBuffer(value));

  CalendarClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Event> createEvent($0.CreateEventRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createEvent, request, options: options);
  }

  $grpc.ResponseStream<$0.Event> listenForEvents($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listenForEvents, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class CalendarServiceBase extends $grpc.Service {
  $core.String get $name => 'Calendar';

  CalendarServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateEventRequest, $0.Event>(
        'CreateEvent',
        createEvent_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateEventRequest.fromBuffer(value),
        ($0.Event value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Event>(
        'ListenForEvents',
        listenForEvents_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Event value) => value.writeToBuffer()));
  }

  $async.Future<$0.Event> createEvent_Pre($grpc.ServiceCall call,
      $async.Future<$0.CreateEventRequest> request) async {
    return createEvent(call, await request);
  }

  $async.Stream<$0.Event> listenForEvents_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* listenForEvents(call, await request);
  }

  $async.Future<$0.Event> createEvent(
      $grpc.ServiceCall call, $0.CreateEventRequest request);
  $async.Stream<$0.Event> listenForEvents(
      $grpc.ServiceCall call, $1.Empty request);
}
