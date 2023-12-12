import { useState, type FC } from 'react';
import Button from '../components/Button';
import Input from '../components/Input';
import { useMotdSetMessage } from './wagmi.generated';

interface ChangeMessageProps {}

const ChangeMessage: FC<ChangeMessageProps> = () => {
  const [value, setValue] = useState('');
  const { write } = useMotdSetMessage({
    args: [value],
  });

  return (
    <div className="flex flex-col w-full">
      <Input value={value} onChange={(e) => setValue(e.target.value)} placeholder="Saisissez ici le nombre de Token que vous souhaitez envoyer ..." className="mb-4" style={{width: "28em"}} />
      <Button disabled={!write || !value} onClick={(e) => write?.()}>
        Validate
      </Button>
    </div>
  );
};

export default ChangeMessage;