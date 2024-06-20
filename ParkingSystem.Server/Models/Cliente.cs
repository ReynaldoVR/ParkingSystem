namespace ParkingSystem.Server.Models
{
    public class Cliente
    {
        public int Id_cli { get; set; }
        public int? Id_usu_cli { get; set; }
        public string Nombre_cli { get; set; }
        public string Apellido_cli { get; set; }
        public string Dni_cli { get; set; }
        public string Telefono_cli { get; set; }
        public string Direccion_cli { get; set; }
    }
}