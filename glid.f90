subroutine glid
    use params
    use globals

    implicit none
    integer i, j
    real(8) temp_x, temp_y

    open(13,file = 'meshfile.txt')
    do j = jmin-3, jmax+2
        do i = imin-3, imax+2
            !物理空間初期分布
            !傾き無し
            temp_x = -range_x / 2.0d0 + dx * dble(i)
            temp_y = -range_y / 2.0d0 + dy * dble(j)

            !傾きtheta
            x(i, j) = cos(theta) * temp_x - sin(theta) * temp_y
            y(i, j) = sin(theta) * temp_x + cos(theta) * temp_y
            write(13,*) x(i,j), ',',  y(i,j)

            !x(i, j) = -range_x / 2.0d0 + dx * dble(i)
            !y(i, j) = -range_y / 2.0d0 + dy * dble(j)
        end do
    end do
    close(13)

end subroutine glid