import clsx from 'clsx'; // pour des className CSS conditionnels - dynamiques
import type { ComponentPropsWithoutRef, FC } from 'react';

interface CardProps extends ComponentPropsWithoutRef<'div'> {}

const Card: FC<CardProps> = ({ className, ...props }) => {
  return <div className={clsx('p-4 border border-gray-200 rounded-lg', className)} {...props} />;
};

export default Card;