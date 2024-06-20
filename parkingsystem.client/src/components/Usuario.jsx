import { useState, useEffect } from 'react';
import axios from 'axios';

const Usuario = () => {
    const [usuarios, setUsuarios] = useState([]);
    const [formData, setFormData] = useState({
        Id_usu: '',
        Nombre_usu: '',
        Email_usu: '',
        Contrasenia_usu: '',
        Rol_usu: ''
    });

    useEffect(() => {
        fetchUsuarios();
    }, []);

    const fetchUsuarios = async () => {
        const response = await axios.get('api/Usuario');
        console.log(response.data);
        setUsuarios(response.data);
    };

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        await axios.post('api/Usuario', formData);
        fetchUsuarios();
    };

    return (
        <div>
            <h2>Usuarios</h2>
            <form onSubmit={handleSubmit}>
                <input type="text" name="Nombre_usu" placeholder="Nombre" onChange={handleChange} />
                <input type="email" name="Email_usu" placeholder="Email" onChange={handleChange} />
                <input type="password" name="Contrasenia_usu" placeholder="Contraseña" onChange={handleChange} />
                <input type="text" name="Rol_usu" placeholder="Rol" onChange={handleChange} />
                <button type="submit">Agregar Usuario</button>
            </form>
            <ul>
                {usuarios.map(usuario => (
                    <li key={usuario.Id_usu}>Nombre {usuario.Nombre_usu} - Correo {usuario.Email_usu} - Rol {usuario.Rol_usu}</li>
                ))}
            </ul>
        </div>
    );
};

export default Usuario;