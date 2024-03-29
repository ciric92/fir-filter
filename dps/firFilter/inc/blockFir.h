/*
 * Experiment assembly implementation of block FIR filter - Chapter 3
 * blockFir.h
 *
 * Description: This is the header file for fixed-point FIR filter
 *
 *  Created on: May 13, 2012
 *      Author: BLEE
 *
 * 		For the book "Real Time Digital Signal Processing:
 *                    Fundamentals, Implementation and Application, 3rd Ed"
 * 		              By Sen M. Kuo, Bob H. Lee, and Wenshun Tian
 * 		              Publisher: John Wiley and Sons, Ltd
 */

#define  NUM_TAPS   18
#define  NUM_DATA   5000

void blockFir(Int16 *x, Int16 blkSize,
			  Int16 *h, Int16 order,
              Int16 *y,
              Int16 *w, Int16 *index);
