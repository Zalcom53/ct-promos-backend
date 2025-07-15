<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET, POST, PATCH, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

require_once __DIR__ . '/../config/db.php';

$method = $_SERVER['REQUEST_METHOD'];
$conn = getConnection();

switch ($method) {
    case 'GET':
        $result = pg_query($conn, "SELECT * FROM producto ORDER BY id DESC");
        $rows = [];
        while ($row = pg_fetch_assoc($result)) {
            $rows[] = $row;
        }
        echo json_encode($rows);
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"), true);

        $query = "INSERT INTO producto (producto, importe, moneda, fecha_inicio, fecha_fin, estatus, comentario)
                  VALUES ($1, $2, $3, $4, $5, $6, $7)";
        $params = [
            $data['producto'], $data['importe'], $data['moneda'],
            $data['fechaInicio'], $data['fechaFin'], $data['estatus'], $data['comentario']
        ];
        $result = pg_query_params($conn, $query, $params);

        echo json_encode(["success" => $result !== false]);
        break;

    case 'PATCH':
        $data = json_decode(file_get_contents("php://input"), true);

        $query = "UPDATE producto SET producto = $1, importe = $2, moneda = $3, fecha_inicio = $4,
                  fecha_fin = $5, estatus = $6, comentario = $7 WHERE id = $8";
        $params = [
            $data['producto'], $data['importe'], $data['moneda'],
            $data['fechaInicio'], $data['fechaFin'], $data['estatus'],
            $data['comentario'], $data['id']
        ];
        $result = pg_query_params($conn, $query, $params);

        echo json_encode(["success" => $result !== false]);
        break;

    case 'OPTIONS':
        http_response_code(200);
        break;

    default:
        http_response_code(405);
        echo json_encode(["error" => "Método no permitido"]);
}
?>
