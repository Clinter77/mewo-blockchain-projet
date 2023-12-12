import { type FC } from 'react';
import { useMotdMessage } from './wagmi.generated';

interface MotdProps {}

const Motd: FC<MotdProps> = () => {
  const { data } = useMotdMessage();
  console.log('data : ')
  console.log(data)
  return <p className="mb-2">Current MOTD: {data}</p>;
};

export default Motd;