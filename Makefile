flutter-app:
	protoc --dart_out=grpc:../ble-app/lib/utils/grpc/proto -I. \
  ./authentication.proto ./chat.proto \
  ./common.proto ./error.proto ./friend.proto \
  ./health_check.proto \
  ./school.proto ./user.proto \
  google/protobuf/timestamp.proto google/protobuf/wrappers.proto
