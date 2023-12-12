// import { useState } from 'react'
import './App.css'
import Form from './web3/Form.tsx';
import ChangeMessage from './web3/ChangeMessage.tsx';
import Header from './web3/Header';
import Wagmi from './web3/Wagmi.tsx';

function App() {
  // const [count, setCount] = useState(0)

  return (
    <Wagmi>
      <div className="flex flex-col h-screen">
        <Header />

        <div className="flex items-center justify-center flex-grow">
          <div className="min-w-[400px] border border-gray-400 rounded">
            <div className="p-4">
              <Form />
            </div>
          </div>
        </div>
      </div>
    </Wagmi>
  )
}

export default App
