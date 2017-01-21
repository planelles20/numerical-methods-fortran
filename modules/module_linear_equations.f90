!-----------------------------------------------------------------------
! This module solve linear equations using:
!   1. LU descomposition
!   2. PLU (TODO)
!   3. QR  (TODO)
!
! Licensing: This code is distributed under the GNU GPL license.
! Author: Carlos Planelles Alemany, planelles20(at)gmail(dot)com
!-----------------------------------------------------------------------
module module_linear_equations

implicit none

contains

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! LU descomposition
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine lu(A, L, U)
    real, intent(in) :: A(:,:)
    real, intent(out), allocatable :: L(:,:), U(:,:)
    integer :: i, j

    allocate(L(size(A,1),size(A,2)), U(size(A,1),size(A,2)))
    forall(i=1:size(A,1)) L(i,i) = 1.0
    do j = 1, size(A,2)
      do i = 1, j
        U(i,j) = A(i,j) - dot_product(L(i,1:i-1), U(1:i-1,j))
      end do
      do i = j+1, size(A,2)
        L(i,j) = (A(i,j) - dot_product(L(i,1:j-1), U(1:j-1,j))) / U(j,j)
      end do
    end do
end subroutine

function ascend(A, b) result(x)
    real, intent(in) :: A(:,:), b(:)
    real, allocatable :: x(:)
    integer :: i, j, n

    n = size(A, 2)
    allocate(x(n))
    x(n) = b(n) / A(n,n)
    do i = n-1, 1, -1
      x(i) = (b(i) - dot_product(A(i,i+1:n), x(i+1:n))) / A(i,i)
    end do
end function

function drop(A, b) result(x)
    real, intent(in) :: A(:,:), b(:)
    real, allocatable :: x(:)
    integer :: i, j, n

    n = size(A, 2)
    allocate(x(n))
    x(1) = b(1) / A(1,1)
    do i = 2, n
      x(i) = (b(i) - dot_product(A(i,1:i-1), x(1:i-1))) / A(i,i)
    end do
end function

function resol_lu(A, b) result(x)
    real, intent(in) :: A(:,:), b(:)
    real, allocatable :: x(:)
    real, allocatable :: L(:,:), U(:,:)

    call lu(A, L, U)
    x = ascend(U, drop(L, b))
end function

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! QR
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


end module
