import 'package:dio/dio.dart';
import 'package:hotel_management_system/API/Apis.dart';
import 'package:hotel_management_system/AppConfig.dart';
import 'package:hotel_management_system/constants/KitchenTimeOfDayEnum.dart';
import 'package:hotel_management_system/models/Client.dart';
import 'package:hotel_management_system/models/DTO/AddReservationDTO.dart';
import 'package:hotel_management_system/models/DTO/KitchenDishesDTO.dart';
import 'package:hotel_management_system/models/RoomIssue.dart';
import 'package:hotel_management_system/models/Staff.dart';
import 'package:retrofit/retrofit.dart';

part 'StaffApiClient.g.dart';

@RestApi(baseUrl: AppConfig.apiBaseUrl)
abstract class StaffApiClient {
  factory StaffApiClient(Dio dio, {String baseUrl}) = _StaffApiClient;

  @GET(Apis.getMyDetails)
  Future<Staff> getMyDetails();

  @GET(Apis.getFoodPreferences)
  Future<KitchenDishesDTO> getFoodPreferences(@Path('time-of-day') KitchenTimeOfDayEnum timeOfDay);

  @GET(Apis.getRoomIssues)
  Future<RoomIssue> getRoomIssues(@Path('room-id') int roomId);

  @POST(Apis.startRoomIssue)
  Future<HttpResponse> startRoomIssue(@Path('issue-id') int issueId);

  @POST(Apis.resolveRoomIssues)
  Future<HttpResponse> resolveRoomIssues(@Path('issue-id') int issueId);

  @POST(Apis.getAllClients)
  Future<List<Client>> getAllClients();

  @POST(Apis.acceptPayment)
  Future<HttpResponse> acceptPayment(@Query('paymentId') int paymentId);

  @POST(Apis.checkIn)
  Future<HttpResponse> checkIn(@Query('clientId') int clientId, @Query('residenceId') int residenceId);

  @POST(Apis.checkOut)
  Future<HttpResponse> checkOut(@Query('checkedInId') int checkedInId);

  @POST(Apis.modifyClientReservation)
  Future<HttpResponse> modifyClientReservation(
    @Path("reservation-id") int reservationId,
    @Query('clientId') int clientId,
    @Query('addReservationDTO') AddReservationDTO addReservationDTO,
  );
}
