import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> fetchDataFromAPI(double latitude, double longitude) async {

  // print(latitude);
  // print(longitude);

  const day_range = 4;

  // Get the current date
  DateTime now = DateTime.now();
  DateTime subtractDate = now.subtract(Duration(days: 3)); // Subtract 3 day

  int year = subtractDate.year;
  int month = subtractDate.month;
  int day = subtractDate.day;

  // print("Year: $year");
  // print("Month: $month");
  // print("Day: $day");

  var map_key = '4f74cc343d99dbb1be7269477901950e';

  var west = longitude - 3;
  var south = latitude - 3;
  var east = longitude + 3;
  var north = latitude + 3;

  final response = await http.get(Uri.parse('https://firms.modaps.eosdis.nasa.gov/api/area/csv/$map_key/VIIRS_SNPP_NRT/$west,$south,$east,$north/$day_range/$year-$month-$day'));

  if (response.statusCode == 200) {
    final csvString = response.body;
    final csvLines = const CsvToListConverter(eol: '\n').convert(csvString); // Split CSV string into data
    final List<Map<String, dynamic>> dataList = [];

    // Start getting data from second line (skip header)
    for (var i = 1; i < csvLines.length; i++) {
      final row = csvLines[i];

      // Check the row has at least two columns (LatLong)
      if (row.length >= 2) {
        final latitude = double.tryParse(row[0].toString()) ?? 0.0;
        final longitude = double.tryParse(row[1].toString()) ?? 0.0;
        // final title = 'Detected heat at $latitude, $longitude';
        final acq_date = row[5];
        final customMarkerId = '$latitude,$longitude,$acq_date';

        final markerData = {
          'latitude': latitude,
          'longitude': longitude,
          // 'title': title,
          'acq_date': acq_date,
          'customMarkerId': customMarkerId,
        };

        dataList.add(markerData);
      }
    }

    return dataList;
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}