import { useState, useEffect } from 'react';
import axios from 'axios';

const Cliente = () => {
    const [clientes, setClientes] = useState([]);
    const [formData, setFormData] = useState({
        Id_cli: '',
        Id_usu_cli: '',
        Nombre_cli: '',
        Apellido_cli: '',
        Dni_cli: '',
        Telefono_cli: '',
        Direccion_cli: ''
    });

    useEffect(() => {
        fetchClientes();
    }, []);

    const fetchClientes = async () => {
        const response = await axios.get('api/Cliente');
        setClientes(response.data);
    };

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        await axios.post('api/Cliente', formData);
        fetchClientes();
    };

    return (
        <div>
            <h2>Clientes</h2>
            <form onSubmit={handleSubmit}>
                <input type="text" name="Id_usu_cli" placeholder="ID Usuario" onChange={handleChange} />
                <input type="text" name="Nombre_cli" placeholder="Nombre" onChange={handleChange} />
                <input type="text" name="Apellido_cli" placeholder="Apellido" onChange={handleChange} />
                <input type="text" name="Dni_cli" placeholder="DNI" onChange={handleChange} />
                <input type="text" name="Telefono_cli" placeholder="Teléfono" onChange={handleChange} />
                <input type="text" name="Direccion_cli" placeholder="Dirección" onChange={handleChange} />
                <button type="submit">Agregar Cliente</button>
            </form>
            <ul>
                {clientes.map(cliente => (
                    <li key={cliente.Id_cli}>Usuario {cliente.Id_usu_cli} - Nombre {cliente.Nombre_cli} {cliente.Apellido_cli} - DNI {cliente.Dni_cli} - Contacto {cliente.Telefono_cli} - Direccion {cliente.Direccion_cli}</li>
                ))}
            </ul>
        </div>
    );
};

export default Cliente;