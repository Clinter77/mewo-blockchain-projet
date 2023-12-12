import React, { useState } from 'react';

const Form: React.FC = () => {
  const [numberInput, setNumberInput] = useState<number | string>('');

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    const inputValue = event.target.value;
    // Assurez-vous que la valeur est un nombre ou une chaîne vide
    setNumberInput(/^\d+$/.test(inputValue) ? parseInt(inputValue, 10) : '');
  };

  const handleSubmit = (event: React.FormEvent) => {
    event.preventDefault();
    // Envoyez la valeur stockée dans l'état (numberInput)
    console.log('Valeur envoyée :', numberInput);
  };

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Combien de Tokens souhaitez-vous déposer ?&nbsp;
        <input
          type="text"
          value={numberInput}
          onChange={handleInputChange}
          placeholder='nombre de Tokens'
        />
      </label>
      <button type="submit">Envoyer</button>
    </form>
  );
};

export default Form;