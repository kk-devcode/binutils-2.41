/* Test view numbering continuity at subsection borders.

   Copyright (C) 2017-2023 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

	.file "dwarf2-19.c"
	.text 0
	.balign 8
	.globl _start
_start:
	.file 1 "dwarf2-19.c"
	.loc 1 1 view 0

	.section .rodata
	.uleb128 .L1
	.uleb128 .L3
	.uleb128 .L4
	.uleb128 .L2

	.text 1
	.loc 1 2 view .L1 	/* same address as view 0 above -> view 1 */

	.text 2
	.loc 1 3 view .L2	/* same address as .L4 below -> view 2 */

	.text 1
	.quad 0
	.loc 1 4 view .L3	/* bumped address from .L1's, view 0 */
	.loc 1 5 view .L4	/* same address, view 1 */
