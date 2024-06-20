import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import Usuario from './components/Usuario';
import Cliente from './components/Cliente';
import Automovil from './components/Automovil';
import Estacionamiento from './components/Estacionamiento';
import './App.css';

function App() {
    return (
        <Router>
            <div>
                <nav>
                    <ul>
                        <li>
                            <Link to="/usuarios">Usuarios</Link>
                        </li>
                        <li>
                            <Link to="/clientes">Clientes</Link>
                        </li>
                        <li>
                            <Link to="/automoviles">Automoviles</Link>
                        </li>
                        <li>
                            <Link to="/estacionamientos">Estacionamientos</Link>
                        </li>
                    </ul>
                </nav>

                <Routes>
                    <Route path="/usuarios" element={<Usuario />} />
                    <Route path="/clientes" element={<Cliente />} />
                    <Route path="/automoviles" element={<Automovil />} />
                    <Route path="/estacionamientos" element={<Estacionamiento />} />
                    <Route path="/" element={<Home />} />
                </Routes>
            </div>
        </Router>
    );
}

function Home() {
    return (
        <div>
            <h2>Bienvenido | Parking System</h2>
            <p>Selecciona una opción para comenzar.</p>
        </div>
    );
}

export default App;
