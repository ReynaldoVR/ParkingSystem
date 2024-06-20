import { useState, useEffect } from 'react';
import axios from 'axios';

const Estacionamiento = () => {
    const [estacionamientos, setEstacionamientos] = useState([]);
    const [formData, setFormData] = useState({
        Id_est: '',
        Id_cli_est: '',
        Id_aut_est: '',
        Numero_plaza_est: '',
        Fecha_entrada_est: '',
        Fecha_salida_est: '',
        Estado_est: false
    });

    useEffect(() => {
        fetchEstacionamientos();
    }, []);

    const fetchEstacionamientos = async () => {
        const response = await axios.get('api/Estacionamiento');
        setEstacionamientos(response.data);
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData(prevState => ({
            ...prevState,
            [name]: name === 'Estado_est' ? e.target.checked : value
        }));
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        await axios.post('api/Estacionamiento', formData);
        fetchEstacionamientos();
    };

    return (
        <div>
            <h2>Estacionamientos</h2>
            <form onSubmit={handleSubmit}>
                <input type="text" name="Id_cli_est" placeholder="ID Cliente" onChange={handleChange} />
                <input type="text" name="Id_aut_est" placeholder="ID Automovil" onChange={handleChange} />
                <input type="text" name="Numero_plaza_est" placeholder="Número de Plaza" onChange={handleChange} />
                <input type="datetime-local" name="Fecha_entrada_est" onChange={handleChange} />
                <input type="datetime-local" name="Fecha_salida_est" onChange={handleChange} />
                <label>
                    Estado
                    <input type="checkbox" name="Estado_est" onChange={handleChange} />
                </label>
                <button type="submit">Agregar Estacionamiento</button>
            </form>
            <ul>
                {estacionamientos.map(estacionamiento => (
                    <li key={estacionamiento.Id_est}>Cliente {estacionamiento.Id_cli_est} - Automovil {estacionamiento.Id_aut_est} - Plaza {estacionamiento.Numero_plaza_est} - Entrada: {new Date(estacionamiento.Fecha_entrada_est).toLocaleString()} - Salida: {new Date(estacionamiento.Fecha_salida_est).toLocaleString()}</li>
                ))}
            </ul>
        </div>
    );
};

export default Estacionamiento;