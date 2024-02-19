flutter-app:
	protoc --dart_out=grpc:../ble-app/lib/utils/grpc/proto -I. \
  ./authentication.proto ./chat.proto \
  ./common.proto ./error.proto ./friend.proto \
  ./health_check.proto \
  ./school.proto ./user.proto \
  google/protobuf/timestamp.proto google/protobuf/wrappers.proto


# 프로토콜 버퍼 컴파일 관련 변수
PROTOC=protoc
PROTOC_GEN_GO=$(GOBIN)/protoc-gen-go
PROTOC_GEN_GO_GRPC=$(GOBIN)/protoc-gen-go-grpc

REMOTE_DIR=.
REMOTE_FILES=$(wildcard $(REMOTE_DIR)/*.proto)
REMOTE_OUT=../telepathy-server/proto/generated
REMOTE_GRPC_OUT=../telepathy-server/proto/generated

server: ./*.proto
	$(PROTOC) -I $(REMOTE_DIR) \
		--go_out=$(REMOTE_OUT) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(REMOTE_GRPC_OUT) \
		--go-grpc_opt=paths=source_relative \
		$(REMOTE_FILES)
