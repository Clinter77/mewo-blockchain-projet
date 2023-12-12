import clsx from 'clsx';  // pour des className CSS conditionnels - dynamiques
import { type ComponentPropsWithoutRef, type FC } from 'react';

interface InputProps extends ComponentPropsWithoutRef<'input'> {}

const Input: FC<InputProps> = ({ className, ...props }) => {
  return <input type="text" className={clsx('py-2 px-3 border border-gray-300 rounded-lg', className)} {...props} />;
};

export default Input;