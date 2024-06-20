import { useState, useEffect } from 'react';
import axios from 'axios';

const Automovil = () => {
    const [automoviles, setAutomoviles] = useState([]);
    const [formData, setFormData] = useState({
        Id_aut: '',
        Id_cli_aut: '',
        Marca_aut: '',
        Modelo_aut: '',
        Placa_aut: ''
    });

    useEffect(() => {
        fetchAutomoviles();
    }, []);

    const fetchAutomoviles = async () => {
        const response = await axios.get('api/Automovil');
        console.log(response);
        setAutomoviles(response.data);
    };

    const handleChange = (e) => {
        setFormData({ ...formData, [e.target.name]: e.target.value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        await axios.post('api/Automovil', formData);
        fetchAutomoviles();
    };

    return (
        <div>
            <h2>Automoviles</h2>
            <form onSubmit={handleSubmit}>
                <input type="text" name="Id_cli_aut" placeholder="ID Cliente" onChange={handleChange} />
                <input type="text" name="Marca_aut" placeholder="Marca" onChange={handleChange} />
                <input type="text" name="Modelo_aut" placeholder="Modelo" onChange={handleChange} />
                <input type="text" name="Placa_aut" placeholder="Placa" onChange={handleChange} />
                <button type="submit">Agregar Automovil</button>
            </form>
            <ul>
                {automoviles.map(automovil => (
                    <li key={automovil.Id_aut}>Cliente {automovil.Id_cli_aut} - Marca {automovil.Marca_aut} - Modelo {automovil.Modelo_aut} - Placa {automovil.Placa_aut}</li>
                ))}
            </ul>
        </div>
    );
};

export default Automovil;